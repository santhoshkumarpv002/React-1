#Base image
FROM node:20-alpine as build
#set workg dir
WORKDIR /app
#copy package.json
COPY package*.json ./

RUN npm install
#Copy all file
COPY . .
#generate public file
RUN npm run build

# COPY --from=build /app/build /app

EXPOSE 3000
CMD ["npm", "start"]