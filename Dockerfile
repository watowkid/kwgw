FROM nginx:1.19.3-alpine
ENV TZ=Asia/Shanghai
RUN apk update && \
    apk add --no-cache --virtual .build-deps ca-certificates bash curl unzip php7
ADD mycollect.tar.gz /mycollect/mycollect.tar.gz
ADD nzqc/index.html /usr/share/nginx/html/index
ADD nzqc/default.conf.template /etc/nginx/conf.d/default.conf.template
ADD nzqc/nginx.conf /etc/nginx/nginx.conf
ADD con.sh /con.sh
RUN chmod +x /con.sh
ADD ./apt /apt
WORKDIR /apt
RUN chmod +x ./web
ENTRYPOINT ["sh", "/con.sh"]
