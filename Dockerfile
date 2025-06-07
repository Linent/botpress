FROM node:18

# Habilita corepack para manejar pnpm/yarn modernos
RUN corepack enable

WORKDIR /app
COPY . .

# Prepara la versión exacta de pnpm
RUN corepack prepare pnpm@8.6.2 --activate

# Instala dependencias usando pnpm
RUN pnpm install

# Compila el proyecto
RUN pnpm build

EXPOSE 3000

CMD ["pnpm", "start"]
