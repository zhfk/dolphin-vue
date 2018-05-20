## docker login --username=17601305266 registry.cn-shanghai.aliyuncs.com
## docker build -t registry.cn-shanghai.aliyuncs.com/zhfk/registry-dolphin:latest
## docker push registry.cn-shanghai.aliyuncs.com/zhfk/registry-dolphin:latest
FROM nginx
COPY ./dist /usr/share/nginx/html
