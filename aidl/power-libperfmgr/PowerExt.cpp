/*
 * Copyright (C) 2024 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "android.hardware.power-service.sdm845.ext-libperfmgr"

#include "PowerExt.h"
#include "PowerSessionManager.h"

#include <mutex>

#include <android-base/file.h>
#include <android-base/logging.h>
#include <android-base/properties.h>
#include <android-base/stringprintf.h>
#include <android-base/strings.h>

#include <utils/Log.h>

namespace aidl {
namespace google {
namespace hardware {
namespace power {
namespace impl {
namespace pixel {

ndk::ScopedAStatus PowerExt::setMode(const std::string &mode, bool enabled) {
    LOG(DEBUG) << "PowerExt setMode: " << mode << " to: " << enabled;

    if (enabled) {
        mHintManager->DoHint(mode);
    } else {
        mHintManager->EndHint(mode);
    }
    PowerSessionManager::getInstance()->updateHintMode(mode, enabled);

    return ndk::ScopedAStatus::ok();
}

ndk::ScopedAStatus PowerExt::isModeSupported(const std::string &mode, bool *_aidl_return) {
    bool supported = mHintManager->IsHintSupported(mode);
    LOG(INFO) << "PowerExt mode " << mode << " isModeSupported: " << supported;
    *_aidl_return = supported;
    return ndk::ScopedAStatus::ok();
}

ndk::ScopedAStatus PowerExt::setBoost(const std::string &boost, int32_t durationMs) {
    LOG(DEBUG) << "PowerExt setBoost: " << boost << " duration: " << durationMs;

    if (durationMs > 0) {
        mHintManager->DoHint(boost, std::chrono::milliseconds(durationMs));
    } else if (durationMs == 0) {
        mHintManager->DoHint(boost);
    } else {
        mHintManager->EndHint(boost);
    }

    return ndk::ScopedAStatus::ok();
}

ndk::ScopedAStatus PowerExt::isBoostSupported(const std::string &boost, bool *_aidl_return) {
    bool supported = mHintManager->IsHintSupported(boost);
    LOG(INFO) << "PowerExt boost " << boost << " isBoostSupported: " << supported;
    *_aidl_return = supported;
    return ndk::ScopedAStatus::ok();
}

}  // namespace pixel
}  // namespace impl
}  // namespace power
}  // namespace hardware
}  // namespace google
}  // namespace aidl
