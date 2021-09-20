FROM python:3.9

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/1.1.9/get-poetry.py | python -
ENV PATH="/root/.poetry/bin:${PATH}"

WORKDIR /app

CMD ["gunicorn", "-w", "4", "drip:drip"]