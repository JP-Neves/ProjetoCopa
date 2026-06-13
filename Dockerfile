## Usa a imagem oficial mais recente do SDK do .NET 9
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /app

# Copia os ficheiros do projeto
COPY *.csproj ./
RUN dotnet restore

# Copia tudo e publica
COPY . ./
RUN dotnet publish -c Release -o out

# Usa a imagem do runtime do .NET 9
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app
COPY --from=build /app/out .

# Define o entrypoint
ENTRYPOINT ["dotnet", "ProjetoCopa.dll"]