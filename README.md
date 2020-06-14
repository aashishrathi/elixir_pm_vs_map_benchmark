# elixir_pm_vs_map_benchmark
Operating System: macOS
CPU Information: Intel(R) Core(TM) i5-5287U CPU @ 2.90GHz
Number of Available Cores: 4
Available memory: 8 GB
Elixir 1.10.3
Erlang 23.0.2

Benchmark suite executing with the following configuration:
warmup: 2 s
time: 5 s
memory time: 0 ns
parallel: 1
inputs: none specified
Estimated total run time: 14 s

Benchmarking of_rna_map...
Benchmarking of_rna_pm...

Name                 ips        average  deviation         median         99th %
of_rna_pm       254.18 K        3.93 μs   ±602.66%           4 μs           7 μs
of_rna_map      251.02 K        3.98 μs   ±412.26%           4 μs           7 μs

Comparison: 
of_rna_pm       254.18 K
of_rna_map      251.02 K - 1.01x slower +0.0495 μs
