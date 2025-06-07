FROM node:18

# Habilita corepack y activa la versión correcta de pnpm
RUN corepack enable
RUN corepack prepare pnpm@8.6.2 --activate

WORKDIR /app
COPY . .

# Instala las dependencias del sistema (opcional pero recomendado para evitar fallos en la build)
RUN apt-get update && apt-get install -y python3 build-essential

# Instala las dependencias del monorepo
RUN pnpm install

# Compila todo
RUN pnpm build

EXPOSE 3000

# ¡Arranca el server de Botpress!
CMD ["pnpm", "start"]
