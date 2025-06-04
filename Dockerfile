FROM nginx:alpine

RUN apk update && apk add --no-cache curl

WORKDIR /app

COPY ./web/configs/ /etc/nginx/conf.d/
COPY ./web/html/ /usr/share/nginx/html/

COPY wait-for-db.sh /app/wait-for-db.sh
RUN chmod +x /app/wait-for-db.sh

ENTRYPOINT ["/app/wait-for-db.sh"]
CMD ["nginx", "-g", "daemon off;"]

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost/ || exit 1
