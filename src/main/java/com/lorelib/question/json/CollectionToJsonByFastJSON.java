package com.lorelib.question.json;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.serializer.SerializerFeature;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * FastJson: 集合序列化成JSON字符串时，如果存在循环引用对象，输出出现问题；
 * 详情请运行如下程序
 * Created by listening on 2016/11/11.
 */
public class CollectionToJsonByFastJSON {
    public static void main(String[] args) {
        List<OrderItem> items = new ArrayList<>();
        items.add(new OrderItem("呢绒的"));

        List<Order> orders = new ArrayList<>();
        Order o1 = new Order("衣服");
        o1.setItems(items);
        orders.add(o1);

        Order o2 = new Order("裤子");
        o2.setItems(items);
        orders.add(o2);

        // 有问题
        System.out.println(JSONArray.toJSONString(orders));
        // 解决方案
        System.out.println(JSONArray.toJSONString(orders, SerializerFeature.DisableCircularReferenceDetect));
    }
}

class Order implements Serializable {
    private String name;
    private List<OrderItem> items;

    public Order(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<OrderItem> getItems() {
        return items;
    }

    public void setItems(List<OrderItem> items) {
        this.items = items;
    }
}

class OrderItem implements Serializable {
    private String name;

    public OrderItem(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
