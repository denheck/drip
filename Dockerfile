FROM python:3.9
WORKDIR /app
EXPOSE 8000

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/1.1.9/get-poetry.py | python -
ENV PATH="/root/.poetry/bin:${PATH}"

COPY poetry.lock pyproject.toml /app/
RUN poetry install

COPY drip /app/

CMD ["poetry", "run", "gunicorn", "-w", "4", "drip.wsgi", "-b", "0.0.0.0:80"]