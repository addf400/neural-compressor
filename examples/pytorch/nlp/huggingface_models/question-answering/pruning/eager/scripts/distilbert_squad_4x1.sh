#!/bin/bash
set -x

    python examples/pytorch/nlp/huggingface_models/question-answering/pruning/eager/run_qa_no_trainer.py \
        --model_name_or_path "/path/to/distilbert-base-uncased/dense_finetuned_model" \
        --dataset_name "squad" \
        --max_seq_length 384 \
        --doc_stride 128 \
        --per_device_train_batch_size 16 \
        --per_device_eval_batch_size 16 \
        --do_prune \
        --num_warmup_steps 1000 \
        --output_dir "./sparse_qa_distilbert" \
        --weight_decay 1e-7 \
        --learning_rate 1e-4 \
        --cooldown_epochs 10 \
        --num_train_epochs 20 \
        --distill_loss_weight 3 \
        --target_sparsity 0.8 \
        --pruning_pattern "4x1" \
        --pruning_frequency 1000