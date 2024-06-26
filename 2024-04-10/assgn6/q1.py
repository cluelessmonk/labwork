# 1. Compute the split point for each attribute in the dataset using the following strategies:
# a. Information Gain
# b. Gini Indexes c. Gain Ratio

# import pandas as pd
# import numpy as np
# from sklearn.tree import DecisionTreeClassifier

# df = pd.read_csv("/Users/ShresthS/Desktop/CSE/ASSGN/SEM6/MINE/2024-04-10/assgn6/vehicle.csv")


# print(df.isnull().sum())


# df.dropna(inplace=True)

# X = df.drop(columns=['class'])  
# y = df['class']

# clf = DecisionTreeClassifier()

# clf.fit(X, y)

# def information_gain(y, y_splits):
#     entropy_parent = entropy(y)
#     total_instances = len(y)
#     weighted_entropy_children = sum((len(y_split) / total_instances) *
#     entropy(y_split) for y_split in y_splits)
#     return entropy_parent - weighted_entropy_children

# def gini_index(y, y_splits):
#     gini_parent = gini_impurity(y)
#     total_instances = len(y)
#     weighted_gini_children = sum((len(y_split) / total_instances) *
#     gini_impurity(y_split) for y_split in y_splits)
#     return gini_parent - weighted_gini_children

# def entropy(y):
#     classes, counts = np.unique(y, return_counts=True)
#     probabilities = counts / len(y)
#     return -sum(p * np.log2(p) for p in probabilities)

# def gini_impurity(y):
#     classes, counts = np.unique(y, return_counts=True)
#     probabilities = counts / len(y)
#     return 1 - sum(p**2 for p in probabilities)


# def compute_split_points(X, y):
#     split_points = {}
#     for col in X.columns:

#         values = X[col].unique()
#         for value in values:

#             left_indices = X[col] < value
#             right_indices = ~left_indices
#             y_splits = [y[left_indices], y[right_indices]]

#             info_gain = information_gain(y, y_splits)
#             gini_idx = gini_index(y, y_splits)
#             gain_ratio = info_gain / (entropy(X[col]) + 1e-10)  # Add small

#             split_points[(col, value)] = {'Information Gain': info_gain,'Gini Index': gini_idx, 'Gain Ratio': gain_ratio}
#     return split_points
# split_points = compute_split_points(X, y)

# for key, value in split_points.items():
#     print(f"Split Point for {key}: {value}")

import pandas as pd
import numpy as np
from sklearn.tree import DecisionTreeClassifier
# Load the dataset
df = pd.read_csv("/Users/ShresthS/Desktop/CSE/ASSGN/SEM6/MINE/2024-04-10/assgn6/vehicle.csv")
# Preprocessing (if required)
# Check for missing values
print(df.isnull().sum())
# Handle missing values (if any)
# For simplicity, let's drop rows with missing values
df.dropna(inplace=True)
# Separate features (X) and target variable (y)
X = df.drop(columns=['class'])  # Assuming 'class' is the target variable
y = df['class']
# Initialize the decision tree classifier
clf = DecisionTreeClassifier()
# Fit the classifier to the data
clf.fit(X, y)

# Function to compute Information Gain
def information_gain(y, y_splits):
    entropy_parent = entropy(y)
    total_instances = len(y)
    weighted_entropy_children = sum((len(y_split) / total_instances) * entropy(y_split) for y_split in y_splits)
    return entropy_parent - weighted_entropy_children
# Function to compute Gini Index
def gini_index(y, y_splits):
    gini_parent = gini_impurity(y)
    total_instances = len(y)
    weighted_gini_children = sum((len(y_split) / total_instances) * gini_impurity(y_split) for y_split in y_splits)
    return gini_parent - weighted_gini_children
# Function to compute entropy
def entropy(y):
    classes, counts = np.unique(y, return_counts=True)
    probabilities = counts / len(y)
    return -sum(p * np.log2(p) for p in probabilities)
# Function to compute Gini impurity
def gini_impurity(y):
    classes, counts = np.unique(y, return_counts=True)
    probabilities = counts / len(y)
    return 1 - sum(p**2 for p in probabilities)
# Function to compute split points using Information Gain, Gini Index, and Gain Ratio
def compute_split_points(X, y):
    split_points = {}
    for col in X.columns:
        # Assuming each attribute is numeric
        values = X[col].unique()
        for value in values:
            # Split the dataset based on the attribute value
            left_indices = X[col] < value
            right_indices = ~left_indices
            y_splits = [y[left_indices], y[right_indices]]
            # Compute metrics for split points
            info_gain = information_gain(y, y_splits)
            gini_idx = gini_index(y, y_splits)
            gain_ratio = info_gain / (entropy(X[col]) + 1e-10)  # Add small value to avoid division by zero
            split_points[(col, value)] = {'Information Gain': info_gain, 'Gini Index': gini_idx, 'Gain Ratio': gain_ratio}
    return split_points
# Compute split points for each attribute
split_points = compute_split_points(X, y)
# Print split points
for key, value in split_points.items():
    print(f"Split Point for {key}: {value}")
