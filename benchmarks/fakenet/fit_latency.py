import pickle as pk
import argparse
import matplotlib.pyplot as plt
import numpy as np
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error, r2_score

def linear_fit(x, y):
    x = np.array(x).reshape(-1, 1)
    y = np.array(y)
    print(x.shape, y.shape)
    model = LinearRegression()
    model.fit(x, y)
    predict_y = model.predict(x)
    
    slope = model.coef_
    intercept = model.intercept_

    print(f"Slope (Coefficient): {slope[0]}")
    print(f"Intercept: {intercept}")
    
    mse = mean_squared_error(y, predict_y)
    r2 = r2_score(y, predict_y)

    print(f"Mean Squared Error: {mse}")
    print(f"R-squared: {r2}")

def fit(args):
    def flatten(ll):
        return [item for sublist in ll for item in sublist]
    filename = f"all_token_times_{args.r}"
    with open(filename, 'rb') as f:
        data = pk.load(f)
    data = flatten(data)
    # remove outlier
    org_len = len(data)
    data = [d for d in data if d[0] < 0.05]
    
    print(f"Remove {org_len - len(data)} outliers, {org_len}/{len(data)}")
    #[(t, num_bacthed_tokens, is_prompt)]
    prompt_data = [d for d in data if d[2]]
    gen_data = [d for d in data if d[2] is False]
    
    num_batch_tokens = [d[1] for d in prompt_data]
    prompt_latencies = [d[0] for d in prompt_data]
    print("=========Prompt============")
    linear_fit(num_batch_tokens, prompt_latencies)
    print("=========Generation============")
    num_batch_tokens = [d[1] for d in gen_data]
    gen_latencies = [d[0] for d in gen_data]
    linear_fit(num_batch_tokens, gen_latencies)
    
    plt.scatter([d[1] for d in prompt_data], [d[0] for d in prompt_data])
    plt.savefig("prompt")
    plt.close()
    plt.scatter([d[1] for d in gen_data], [d[0] for d in gen_data])
    plt.savefig("gen")

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-r", type=float, default=2.0,
                        help="Number of requests per second. If this is inf, "
                             "then all the requests are sent at time 0. "
                             "Otherwise, we use Poisson process to synthesize "
                             "the request arrival times.")
    args = parser.parse_args()
    fit(args)
    
    