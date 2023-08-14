# Others

[@jedidi2021] created an index of relevance (called **R2M** - Relevance to marketing), which measures the relevance of marketing publications to marketing practice (dimensions: topics, time).

[@lin2022] illustrates that consumer identity fragmentation (i.e., a person using multiple devices with different tracking systems) can induce bias the estimate of quantities of interest (e.g., advertising effects). The bias comes from 3 sources:

1.  Outcome fragmentation: measurement errors that create attenuation bias. Due to an artificial increased in the number of observations (i.e., one person with two devices are counted as 2 identities), but the total outcome variation remains constant, while the measured outcome is attenuated. This bias only goes away if the true effect (e.g., advertising effect) is 0.
2.  Exposure fragmentation: similar to omitted variable bias because the cross-device exposure is not taken into account. Hence, only when exposure to one device will not induce a consumer to purchase a product on another device, then this bias will go away (very hard to convince).
3.  Spurious Covariance: from device-level activity bias (i.e., patterns to use one device for browsing but another for purchasing - differential device usage preferences and differential exposure levels), and cross-device sustitution.
    1.  Using a separate model for each device type can eliminate the device-level activity bias.

Solutions to identity fragmentation include

1.  Identity linking: but partially linked data can create more problems than solution
2.  Experiment-based estimator adjustment by [@coey2016] to recover the true effect using experiemnts with an additional assumption of symmetric and independent exposures (SIE). But it can still be wrong due to its inability to capture cross-device variations (e.g., activity bias).
3.  Stratified Aggregation: first group by geographic location, then put each group into a bin of consumer characteristics' combiantions (e.g., sex, gender, education).
