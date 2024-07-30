#!/usr/bin/env python3

from typing import Union
from pandas import DataFrame
from collections import Counter
import pandas as pd

def analytics(dataframe:DataFrame, field:str="type_uid", threshold:Union[int, str]=5):
    if field in dataframe.columns:
        counter = Counter(dataframe[field].to_list())
        cols = {k for k,v in counter.items() if v <= threshold}
        return dataframe[dataframe[field].isin(cols)]
    else:
        return dataframe
