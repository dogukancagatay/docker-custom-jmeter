FROM mwendler/wget AS builder
RUN wget -q --no-check-certificate -O jmeter-plugins-manager-1.3.jar http://search.maven.org/remotecontent?filepath=kg/apc/jmeter-plugins-manager/1.3/jmeter-plugins-manager-1.3.jar
RUN wget -q --no-check-certificate -O jpgc-functions-2.1.zip https://jmeter-plugins.org/files/packages/jpgc-functions-2.1.zip && \
	unzip jpgc-functions-2.1.zip

FROM justb4/jmeter:5.1.1
COPY --from=builder /jmeter-plugins-manager-1.3.jar ${JMETER_HOME}/lib/ext/
COPY --from=builder /lib/*.jar ${JMETER_HOME}/lib/
COPY --from=builder /lib/ext/jmeter-plugins-functions-2.1.jar ${JMETER_HOME}/lib/ext/
