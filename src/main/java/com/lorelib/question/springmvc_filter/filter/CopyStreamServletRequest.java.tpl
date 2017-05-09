package com.lorelib.question.springmvc_filter.filter;

import com.fxtcn.finance.common.utils.StringUtil;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * @author listening
 * @description CopyStreamServletRequest:
 * @create 2017 04 27 18:24.
 */
public class CopyStreamServletRequest extends HttpServletRequestWrapper {
    private final byte[] body;

    /**
     * Constructs a request object wrapping the given request.
     *
     * @param request
     * @throws IllegalArgumentException if the request is null
     */
    public CopyStreamServletRequest(HttpServletRequest request) throws IOException {
        super(request);
        body = toBytes(request);
    }

    @Override
    public BufferedReader getReader() throws IOException {
        return new BufferedReader(new InputStreamReader(this.getInputStream()));
    }

    @Override
    public ServletInputStream getInputStream() throws IOException {
        final ByteArrayInputStream in = new ByteArrayInputStream(body);
        return new ServletInputStream() {
            @Override
            public int read() throws IOException {
                return in.read();
            }
        };
    }

    private byte[] toBytes(HttpServletRequest request) throws IOException {
        String content = "";
        BufferedReader reader = request.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            content += line;
        }
        return StringUtil.isNotBlank(content) ? content.getBytes("UTF-8") : null;
    }

    public byte[] getBody() {
        return body;
    }
}
