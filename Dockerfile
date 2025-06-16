FROM node:18

WORKDIR /app

COPY package*.json ./

ARG JFROG_TOKEN

RUN echo "//veednainc.jfrog.io/artifactory/api/npm/github-build-npm/:_authToken=${JFROG_TOKEN}" > .npmrc && \
    echo "//veednainc.jfrog.io/artifactory/github-build-npm/:_authToken=${JFROG_TOKEN}" >> .npmrc && \
    echo "always-auth=true" >> .npmrc

RUN npm install

CMD ["echo", "Install complete"]