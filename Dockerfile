FROM mobiledevops/flutter-sdk-image:3.16.4
COPY . .
RUN make build-mf-production