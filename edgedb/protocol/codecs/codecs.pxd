#
# This source file is part of the EdgeDB open source project.
#
# Copyright 2016-present MagicStack Inc. and the EdgeDB authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


include "./base.pxd"
include "./scalar.pxd"
include "./tuple.pxd"
include "./namedtuple.pxd"
include "./object.pxd"
include "./array.pxd"
include "./set.pxd"


cdef class CodecsRegistry:

    cdef:
        LRUMapping codecs_build_cache
        LRUMapping codecs

    cdef BaseCodec _build_codec(self, FRBuffer *spec, list codecs_list)
    cdef BaseCodec build_codec(self, bytes spec)

    cdef has_codec(self, bytes type_id)
    cdef BaseCodec get_codec(self, bytes type_id)