/*
 * Copyright (c) 2022, NVIDIA CORPORATION.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#pragma once

#include <cuspatial/cuda_utils.hpp>
#include <cuspatial/vec_2d.hpp>

namespace cuspatial {

template <typename T>
class segment {
 public:
  using value_type = T;
  vec_2d<T> first;
  vec_2d<T> second;

  /// Return a copy of segment, translated by `v`.
  segment<T> CUSPATIAL_HOST_DEVICE translate(vec_2d<T> const& v) const
  {
    return segment<T>{first + v, second + v};
  }

  /// Return the geometric center of segment.
  vec_2d<T> CUSPATIAL_HOST_DEVICE center() const { return midpoint(first, second); }
};

}  // namespace cuspatial