

FROM eclipse-temurin:latest

RUN mkdir /jars/

WORKDIR /jars/


RUN curl -Lo webgoat.jar https://github.com/WebGoat/WebGoat/releases/download/v8.2.2/webgoat-server-8.2.2.jar

RUN curl -Lo dd-java-agent.jar https://dtdg.co/latest-java-tracer

EXPOSE 8000

ENTRYPOINT [ \
   "java", \
   "-Duser.home=/jars", \
   "-Dfile.encoding=UTF-8", \
   "--add-opens", "java.base/java.lang=ALL-UNNAMED", \
   "--add-opens", "java.base/java.util=ALL-UNNAMED", \
   "--add-opens", "java.base/java.lang.reflect=ALL-UNNAMED", \
   "--add-opens", "java.base/java.text=ALL-UNNAMED", \
   "--add-opens", "java.desktop/java.beans=ALL-UNNAMED", \
   "--add-opens", "java.desktop/java.awt.font=ALL-UNNAMED", \
   "--add-opens", "java.base/sun.nio.ch=ALL-UNNAMED", \
   "--add-opens", "java.base/java.io=ALL-UNNAMED", \
   "--add-opens", "java.base/java.util=ALL-UNNAMED", \
   "-Drunning.in.docker=true", \
   "-Dserver.address=0.0.0.0", \
   "-Dserver.port=8000", \
   "-jar", "webgoat.jar", \
   "-javaagent", "dd-java-agent.jar" ]
