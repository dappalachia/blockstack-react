FROM dappalachia/nodejs

RUN addgroup -S blockstack && \
    adduser -S -G blockstack blockstack && \
    chown -R blockstack:blockstack /app

USER blockstack

COPY ./ /app

ENTRYPOINT ["/app/docker-entrypoint.sh"]

CMD ["npm", "start"]