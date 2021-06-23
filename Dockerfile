FROM node:10.14.1

RUN mkdir -p /usr/src/sports_shop

COPY build /usr/src/sports_shop/build

COPY authMiddleware.js /usr/src/sports_shop/
COPY productionData.json /usr/src/sports_shop/
COPY server.js /usr/src/sports_shop/
COPY deploy-package.json /usr/src/sports_shop/package.json

COPY serverQueriesSchema.graphql /usr/src/sports_shop/
COPY serverQueriesResolver.js /usr/src/sports_shop/ 
COPY serverMutationsSchema.graphql /usr/src/sports_shop/
COPY serverMutationsResolver.js /usr/src/sports_shop/

WORKDIR /usr/src/sports_shop

RUN echo 'package-lock=false' >> .npmrc

RUN npm install

EXPOSE 80

CMD ["node", "server.js", "./productionData.json", "80"]