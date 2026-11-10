# Step 3: compare the open-data match with the paper's Table 1.
# Applies a startup screen like the paper's (drop portfolios above the
# largest retained target, 504 patents) and reports Pr(any patent) and the
# mean portfolio among patent-holding targets, beside the paper's figures.
suppressMessages(library(data.table))
od <- commandArgs(TRUE)[1]
m <- fread(file.path(od, "target_patents.csv"))
deals <- fread(file.path(od, "wiki_deals.csv"))[year >= 1987 & year <= 2020]
port <- m[, .(n = .N), by = .(acquirer, target, year)]
big <- port[n > 504]
cat("Screened out as non-startup (>504 patents):\n"); print(big[order(-n)])
port <- port[n <= 504]
nd <- deals[!big, on = .(acquirer, target, year)][, .(n_deals = .N), by = acquirer]
res <- merge(nd, port[, .(with_pat = .N, mean_pat = mean(n), median_pat = median(n)), by = acquirer],
             by = "acquirer", all.x = TRUE)
paper <- data.table(acquirer = c("Amazon","Apple","Cisco","Facebook","Google","Intel","Microsoft","Qualcomm"),
                    paper_deals = c(103,126,222,102,260,97,236,44),
                    paper_pr = c(.28,.41,.41,.20,.33,.64,.35,.80),
                    paper_mean = c(30.55,17.65,13.29,5.15,14.87,25.23,15.92,22.51))
res <- merge(res, paper, by = "acquirer", all = TRUE)
res[, `:=`(pr_any = round(with_pat / n_deals, 2), mean_pat = round(mean_pat, 1))]
print(res[, .(acquirer, n_deals, paper_deals, pr_any, paper_pr, mean_pat, median_pat, paper_mean)])
cat("Totals: deals", sum(res$n_deals, na.rm = TRUE), "| targets with patents", sum(res$with_pat, na.rm = TRUE),
    "| patents", sum(port$n), "\n")
