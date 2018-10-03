FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /app
EXPOSE 8008

# copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# copy everything else and build app
COPY . ./
RUN dotnet publish -c Release -o out


FROM microsoft/dotnet:2.1.2-aspnetcore-runtime AS runtime
WORKDIR /app
COPY --from=build /app/out .
ENTRYPOINT ["dotnet", "docker_webapi.dll"]