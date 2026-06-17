# --- Build stage: compile the SvelteKit static site ---
FROM node:22-alpine AS build
WORKDIR /app
COPY package*.json ./
# npm install (not ci) so platform-specific optional native deps resolve
# correctly when building on Linux from a Windows-generated lockfile.
RUN npm install --no-audit --no-fund
COPY . .
RUN npm run build

# --- Serve stage: lightweight nginx serving the prerendered files ---
FROM nginx:alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
