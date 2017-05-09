在springmvc中使用原生filter需配置web.xml

    <context-param>
        <param-name>contextConfigLocation</param-name>
        <param-value>classpath*:spring-*.xml</param-value>
    </context-param>

    <listener>
        <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
    </listener>

    <filter>
        <filter-name>DelegateFilter</filter-name>
        <filter-class>org.springframework.web.filter.DelegatingFilterProxy</filter-class>
        <init-param>
            <param-name>targetBeanName</param-name>
            <param-value>logFilter</param-value>
        </init-param>
    </filter>
    <filter-mapping>
        <filter-name>DelegateFilter</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>


另外注意，如果在filter中调用了
req.getInputStream()
会报如下错误，getInputStream只能使用一次

java.lang.IllegalStateException: getInputStream() has already been called for this request
	at org.apache.catalina.connector.Request.getReader(Request.java:1252)
	at org.apache.catalina.connector.RequestFacade.getReader(RequestFacade.java:505)
	at com.xxx.xxx.xxx.xxx.filter.AuthFilter.getRestfulRequest(AuthFilter.java:79)
	at com.xxx.xxx.xxx.xxx.filter.AuthFilter.doFilter(AuthFilter.java:40)
	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:344)
	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:261)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:85)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:218)
	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:110)
	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:506)
	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:169)
	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:103)
	at org.apache.catalina.valves.AccessLogValve.invoke(AccessLogValve.java:962)
	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:116)
	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:445)
	at org.apache.coyote.http11.AbstractHttp11Processor.process(AbstractHttp11Processor.java:1115)
	at org.apache.coyote.AbstractProtocol$AbstractConnectionHandler.process(AbstractProtocol.java:637)
	at org.apache.tomcat.util.net.AprEndpoint$SocketProcessor.doRun(AprEndpoint.java:2549)
	at org.apache.tomcat.util.net.AprEndpoint$SocketProcessor.run(AprEndpoint.java:2538)
	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)
	at java.lang.Thread.run(Thread.java:745)