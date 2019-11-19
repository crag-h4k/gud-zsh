# Install a list of packages for all conda  environements
for env in $(conda env list | cut -d" " -f1 | tail -n+4); do conda install -n $env $CONDA_PACKAGES; done

#python3 flatten list
list_of_lists = [[180.0], [173.8], [164.2], [156.5], [147.2], [138.2]]
flattened = [val for sublist in list_of_lists for val in sublist]

# pd.DataFrame chunked
chunked_df = [tdf[i:i+n] for i in range(0,tdf.shape[0],n)]

# Logging rather than print - from Devin Parsons
import logging
logging.getLogger("requests").setLevel(logging.WARNING)
logging.getLogger("urllib3").setLevel(logging.WARNING)

logger = logging.getLogger('out_of_date_issue_notifier')
logger.propagate = False
logging.captureWarnings(True)
logger.setLevel(logging.INFO)
ch = logging.StreamHandler()
ch.setLevel(logging.INFO)
formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
ch.setFormatter(formatter)
logger.addHandler(ch)
