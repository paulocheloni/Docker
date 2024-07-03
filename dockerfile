# Use the official Go image to create a build artifact.
FROM golang:alpine AS builder

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy go.mod file




# Copy the source code into the container
COPY . .

# Build the Go app
RUN go build -o fullcycle

# Start a new stage from scratch
FROM scratch

# Copy the Pre-built binary file from the previous stage
COPY --from=builder /app/fullcycle /fullcycle

# Command to run the
CMD ["/fullcycle"]