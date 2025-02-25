FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build-env
WORKDIR /app

# Copy everything else and build
COPY . .
RUN dotnet publish -c Release -o out



FROM mcr.microsoft.com/dotnet/aspnet:3.1

MAINTAINER Yoav G

WORKDIR /app
EXPOSE 80
COPY --from=build-env /app/out .

CMD ["dotnet", "TodoApi.dll"]
