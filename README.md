# TPC-DS-Benchmarking

## 21C Oracle DB

Oracle21C_Benchmarking_Guide.pdf and Performace Benchmarking 21c.pdf contain instructions for benchmarking 21C Oracle ADB

## Automomous Oracle DB

oracle_ADB_1GB_100GB contains instructions to setup Oracle ADB on cloud to run 100GB workload of TPC-DS

## Spark 

Clone the spark-tpc-ds-performance-test repo locally. In a terminal, run:

```bash
$ git clone https://github.com/Tanny2109/TPC-DS-Benchmarking 
```

This directory has be reconfigured to work with MacOs

Follow this guideline to set up the environment, Spark and run Spark  
https://github.com/IBM/spark-tpc-ds-performance-test
Use Spark version 3.5.2
Ensure Java version 8 or 11. Newer versions are not compatible with Spark

### Data generation 
spark-tpc-ds-performance-test directory only contains TPC-DS workload at 1GB Scale. 
To obtain higher TPC-DS workload, download it from TPC.com or clone the repo TPC_DS_toolkit_2.2
This toolkit has be reconfigured to work with MacOs

```bash
git clone https://github.com/Tanny2109/TPC-DS-Benchmarking/TPC_DS_toolkit_2.2/
```

Follow this guideline to generate TPC-DS  data at different scales and  queries 
https://github.com/IBM/spark-tpc-ds-performance-test
