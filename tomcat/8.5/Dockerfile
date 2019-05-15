FROM yuweijun/oracle-jdk8:jdk8u171
MAINTAINER yuweijun <test.yu@gmail.com>

ENV JAVA_HOME="/usr/lib/jvm/java-8-oracle" \
    CATALINA_HOME="/usr/local/tomcat" \
    PATH="/usr/local/tomcat/bin:$PATH" \
    TOMCAT_MAJOR_VERSION=8 \
    TOMCAT_MINOR_VERSION=8.5.23 \
    APACHE_MIRROR="https://archive.apache.org/dist" \
    APR_VERSION=1.6.2 \
    TOMCAT_NATIVE_VERSION=1.2.14
RUN mkdir -p "${CATALINA_HOME}"
WORKDIR $CATALINA_HOME

RUN set -x \
  && update-ca-certificates \
  && apt install -y gcc make \
  && wget -q --no-check-certificate "${APACHE_MIRROR}/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz" \
  && tar -xf "apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz" --strip-components=1 \
  && rm bin/*.bat \
  && rm "apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz" \
  && cd /tmp \
  && wget -q --no-check-certificate "${APACHE_MIRROR}/tomcat/tomcat-connectors/native/${TOMCAT_NATIVE_VERSION}/source/tomcat-native-${TOMCAT_NATIVE_VERSION}-src.tar.gz" \
  && wget -q --no-check-certificate "${APACHE_MIRROR}/apr/apr-${APR_VERSION}.tar.gz" \
  && tar -xf "apr-${APR_VERSION}.tar.gz" && cd "apr-${APR_VERSION}" && ./configure && make && make install \
  && cd /tmp && tar -xf "tomcat-native-${TOMCAT_NATIVE_VERSION}-src.tar.gz" && cd "tomcat-native-${TOMCAT_NATIVE_VERSION}-src/native" \
  && ./configure --with-apr="/usr/local/apr/bin" --with-java-home="$JAVA_HOME" --with-ssl=no --prefix="$CATALINA_HOME" \
  && make && make install \
  && ln -sv "${CATALINA_HOME}/lib/libtcnative-1.so" "/usr/lib/" && ln -sv "/lib/libz.so.1" "/usr/lib/libz.so.1" \
  && cd / \
  && rm -rf /tmp/* \
  && sed -i 's/SSLEngine="on"/SSLEngine="off"/g' "${CATALINA_HOME}/conf/server.xml"

EXPOSE 8080
CMD ["catalina.sh", "run"]
