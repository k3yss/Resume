FROM nopreserveroot/latexmk as build-stage

# Set the working directory inside the container
WORKDIR /app


# Copy your LaTeX files into the container
COPY . /app	

# Define the build process
RUN latexmk -pdf -jobname=Rishi_Kumar_Resume Rishi_Kumar_Resume.tex

FROM biolockjdevteam/pdftoppm as build-stage1
# Copy the PDF from the previous stage
COPY --from=build-stage /app/Rishi_Kumar_Resume.pdf /app/Rishi_Kumar_Resume.pdf
RUN pdftoppm -png /app/Rishi_Kumar_Resume.pdf /app/Rishi_Kumar_Resume

# Copy from container to host
FROM scratch AS export-stage
COPY --from=build-stage  /app/Rishi_Kumar_Resume.pdf /Rishi_Kumar_Resume.pdf
COPY --from=build-stage1  /app/Rishi_Kumar_Resume-1.png /Rishi_Kumar_Resume.png


