package com.lorelib.question.junit;

import org.junit.Test;

/**
 * 当主线程完成了，子线程即便没有执行完成也会被junit关闭掉
 * Created by listening on 2016/11/18.
 */
public class JUnitForMultiThreadTest {
    @Test
    public void test() {
        childThread();
        System.out.println("主线程执行完毕！");
    }

    /**
     * 与JUNIT测试对比效果
     * @param args
     */
    public static void main(String[] args) {
        childThread();
        System.out.println("主线程执行完毕！");
    }

    private static void childThread() {
        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    System.out.println("进入子线程...");
                    Thread.sleep(5000L);
                    System.out.println("子线程执行完毕！");
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }).start();
    }
}
