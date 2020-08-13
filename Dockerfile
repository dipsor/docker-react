FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
CMD ["npm", "run", "build"]


FROM ngnix
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
