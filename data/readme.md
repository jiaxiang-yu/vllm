1. all the data are in the pickle format
2. filename is in the form of stats_x, where x is the request rate
3. each stats_x file contains a dictionary
```
{
    'request_latency': [(prompt_len, gen_len, request latency for that request)], # list of stats for each request
    'token_times': [(time for that batch, number of tokens in that batch, if that batch is a prompt run)]
}
```
4. bench_results_tp1 contains the high level information for different request rates (e.g., total time to run all the requests).
