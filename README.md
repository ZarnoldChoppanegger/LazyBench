# LazyBench
Simple scripts to bench multicore programs and plot the results

# Dependencies
* linux tool `time`
* `gnuplot`

# Usage

```bash
./bench.sh program start_value end_value step > data.dat
```

```bash
./plot_data data.dat y_range_min y_range_max
```
