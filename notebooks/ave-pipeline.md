1） extract data from database （ sql，NoSQL， etc ）-> parquet, csv, zip etc
    [package: pymongo (MongoClient), numpy, os, json, etc. Roto 3T] 
2) preprocessing dataset for MLDL model building: 
    [package: os, pickle, yaml, sklearn.model_selection (train_test_split), 
    slearn.feature_extraction.text ( countVectorizer ), sklearn.compose (ColumnTransformer), sklearn.base(BaseEstimator, TransformerMixin, OneToOneFeatureMixin), sklearn.preprocessing (OrdinalEncoder), numpy->np, seaborn, matplotlib.pyplot(plt)]
    1) data cleaning
    2) coorlation anaylzing
    3) one-hot/multi-hot encoding 
    4) histgram for each and ervery features and labels then determine the data distributions
    5) setting for cut-off
    6) scale columns of data to stardationed Gussian, with 0 mean and 1 std_dev (SymLogScaler(matplotlib), StdScaler,... )
    7) transformers of columns...
    8) np.savez('dataset.npz'x_train=, y_train=, x_test=, y_test=, labels=; ... ...)
3) train 
    [package: os{GPU setting}, socket, tensorflow(tf) ...]
    model               model
    encoder   vae       decoder
    x                   x'
    x    1         1    x'
    x    1    z    1    x'
    x    1         1    x'
    x                   x'
4) regression: [ performance evaluation]