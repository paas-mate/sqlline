FROM shoothzj/compile:jdk17-mvn AS compiler

WORKDIR /opt

COPY ./pom.xml ./pom.xml

RUN mvn -B package --file pom.xml

FROM shoothzj/base

WORKDIR /opt/sqlline

COPY --from=compiler /opt/target/lib/ ./
