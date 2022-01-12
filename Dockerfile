FROM inutano/wget AS builder

RUN mkdir -p /downloads
WORKDIR /downloads

RUN wget \
	-q \
	-O jmeter-plugins-manager-1.7.jar \
	"https://repo1.maven.org/maven2/kg/apc/jmeter-plugins-manager/1.7/jmeter-plugins-manager-1.7.jar"

RUN wget \
	-q \
	-O jpgc-functions-2.1.zip \
	"https://jmeter-plugins.org/files/packages/jpgc-functions-2.1.zip" && \
	unzip jpgc-functions-2.1.zip

RUN ls -al /downloads

FROM justb4/jmeter:5.4
COPY --from=builder /downloads/lib/*.jar ${JMETER_HOME}/lib/
COPY --from=builder /downloads/*.jar ${JMETER_HOME}/lib/ext/
COPY --from=builder /downloads/lib/ext/*.jar ${JMETER_HOME}/lib/ext/
