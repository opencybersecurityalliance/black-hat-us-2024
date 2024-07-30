#!/usr/bin/env python3

from pandas import DataFrame
from collections import Counter
import pandas as pd

def emulated_genai_agent(value):
    value = str(value)
    if r"SSEE\sql\query" in value or r"WID\tsql\query" in value:
        answer = f"'{value}' is a path to connect to Windows Internal Database (WID). It can be used to export/exfiltrate AD FS configuration in a cyber attack"
    else:
        answer = f"Sorry, the emulated GenAI agent does not know '{value}'"
    return answer

def analytics(dataframe:DataFrame, prompt:str, field:str):
    if field in dataframe:
        dataframe["unmapped.gen_ai"] = dataframe[field].apply(emulated_genai_agent)
    else:
        dataframe["unmapped.gen_ai"] = [f"Invalid field '{field}'"] * dataframe.shape[0]
    return dataframe
