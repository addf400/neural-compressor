#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Copyright (c) 2020 Intel Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from ilit.utils.utility import LazyImport
from .base_dataloader import BaseDataLoader
mx = LazyImport('mxnet')


class MXNetDataLoader(BaseDataLoader):
    """DataLoader for frameework MXNet, we use the gluon.data.DataLoader
       (TODO) implement the DataIter dataloader while some models use it

    """

    def _generate_dataloader(self, dataset, batch_size, last_batch, collate_fn,
                             sampler, batch_sampler, num_workers, pin_memory):

        return mx.gluon.data.DataLoader(
            dataset,
            batch_size=batch_size,
            batchify_fn=collate_fn,
            last_batch=last_batch,
            num_workers=num_workers,
            pin_memory=pin_memory,
            sampler=sampler,
            batch_sampler=batch_sampler)
