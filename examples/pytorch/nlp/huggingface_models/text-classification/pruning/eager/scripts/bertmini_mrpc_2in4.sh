#!/bin/bash
set -x

    python3 examples/pytorch/nlp/huggingface_models/text-classification/pruning/eager/run_glue_no_trainer.py \
        --model_name_or_path "/path/to/bertmini-mrpc/dense_finetuned_model" \
        --task_name "mrpc" \
        --max_length 128 \
        --per_device_train_batch_size 16 \
        --learning_rate 1e-3 \
        --num_train_epochs 15 \
        --weight_decay 1e-3  \
        --do_prune \
        --output_dir "./sparse_mrpc_bertmini_2in4" \
        --cooldown_epochs 5 \
        --sparsity_warm_epochs 1 \
        --target_sparsity 0.5 \
        --pruning_pattern "2:4" \
        --pruning_frequency 50 \
        --lr_scheduler_type "constant" \
        --distill_loss_weight 5