FROM nginx:latest

# Set some labels to identify it as an S2I builder image
LABEL io.k8s.s2i.scripts-url=image:///usr/libexec/s2i
LABEL io.openshift.s2i.scripts-url=image:///usr/libexec/s2i

# Copy the S2I assemble and run scripts from a directory in your local project
COPY ./.s2i/bin/ /usr/libexec/s2i

# Set the user to run the builder
USER 1001

# Expose port 8080 (or any other port you want to expose)
EXPOSE 8080

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]