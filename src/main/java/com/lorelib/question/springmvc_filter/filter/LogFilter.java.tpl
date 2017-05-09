package com.lorelib.question.springmvc_filter.filter;

import com.fxtcn.finance.common.utils.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * @author listening
 * @description LogFilter:
 * @create 2017 04 28 19:16.
 */
@Component
public class LogFilter implements Filter {
    private final static Logger LOGGER = LoggerFactory.getLogger(LogFilter.class);

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        CopyStreamServletRequest req = new CopyStreamServletRequest((HttpServletRequest) request);

        if (req.getBody() != null) {
            String requestData = new String(req.getBody(), "UTF-8");
            LOGGER.info("[ip: " + getIp(req) + ", requestData: " + requestData + "]");
        }
        chain.doFilter(req, response);
    }

    @Override
    public void destroy() {

    }

    public static String getIp(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");
        if (StringUtil.isNotBlank(ip) && !"unKnown".equalsIgnoreCase(ip)) {
            //多次反向代理后会有多个ip值，第一个ip才是真实ip
            int index = ip.indexOf(",");
            if (index != -1) {
                return ip.substring(0, index);
            } else {
                return ip;
            }
        }
        ip = request.getHeader("X-Real-IP");
        if (StringUtil.isNotBlank(ip) && !"unKnown".equalsIgnoreCase(ip)) {
            return ip;
        }
        return request.getRemoteAddr();
    }
}
