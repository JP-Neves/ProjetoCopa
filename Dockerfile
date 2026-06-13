# Usa a imagem oficial completa do SDK 9.0
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /app

# Copia tudo para o container
COPY . .

# Restaura e publica explicitamente
RUN dotnet restore
RUN dotnet publish -c Release -o out

# Usa a imagem oficial do ASP.NET 9.0
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app
COPY --from=build /app/out .

# Comando de entrada
ENTRYPOINT ["dotnet", "ProjetoCopa.dll"]