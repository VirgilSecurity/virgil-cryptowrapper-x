/// Copyright (C) 2015-2019 Virgil Security, Inc.
///
/// All rights reserved.
///
/// Redistribution and use in source and binary forms, with or without
/// modification, are permitted provided that the following conditions are
/// met:
///
///     (1) Redistributions of source code must retain the above copyright
///     notice, this list of conditions and the following disclaimer.
///
///     (2) Redistributions in binary form must reproduce the above copyright
///     notice, this list of conditions and the following disclaimer in
///     the documentation and/or other materials provided with the
///     distribution.
///
///     (3) Neither the name of the copyright holder nor the names of its
///     contributors may be used to endorse or promote products derived from
///     this software without specific prior written permission.
///
/// THIS SOFTWARE IS PROVIDED BY THE AUTHOR ''AS IS'' AND ANY EXPRESS OR
/// IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
/// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
/// DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT,
/// INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
/// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
/// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
/// HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
/// STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
/// IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
/// POSSIBILITY OF SUCH DAMAGE.
///
/// Lead Maintainer: Virgil Security Inc. <support@virgilsecurity.com>


import Foundation
import VSCFoundation

/// Provide interface for data encryption.
@objc(VSCFAuthDecrypt) public protocol AuthDecrypt : CipherAuthInfo {

    /// Decrypt given data.
    /// If 'tag' is not give, then it will be taken from the 'enc'.
    @objc func authDecrypt(data: Data, authData: Data, tag: Data) throws -> Data

    /// Calculate required buffer length to hold the authenticated decrypted data.
    @objc func authDecryptedLen(dataLen: Int) -> Int
}

/// Implement interface methods
@objc(VSCFAuthDecryptProxy) internal class AuthDecryptProxy: NSObject, AuthDecrypt {

    /// Handle underlying C context.
    @objc public let c_ctx: OpaquePointer

    /// Defines authentication tag length in bytes.
    @objc public var authTagLen: Int {
        return vscf_cipher_auth_info_auth_tag_len(vscf_cipher_auth_info_api(self.c_ctx))
    }

    /// Take C context that implements this interface
    public init(c_ctx: OpaquePointer) {
        self.c_ctx = c_ctx
        super.init()
    }

    /// Release underlying C context.
    deinit {
        vscf_impl_delete(self.c_ctx)
    }

    /// Decrypt given data.
    /// If 'tag' is not give, then it will be taken from the 'enc'.
    @objc public func authDecrypt(data: Data, authData: Data, tag: Data) throws -> Data {
        let outCount = self.authDecryptedLen(dataLen: data.count)
        var out = Data(count: outCount)
        var outBuf = vsc_buffer_new()
        defer {
            vsc_buffer_delete(outBuf)
        }

        let proxyResult = data.withUnsafeBytes({ (dataPointer: UnsafePointer<byte>) -> vscf_status_t in
            authData.withUnsafeBytes({ (authDataPointer: UnsafePointer<byte>) -> vscf_status_t in
                tag.withUnsafeBytes({ (tagPointer: UnsafePointer<byte>) -> vscf_status_t in
                    out.withUnsafeMutableBytes({ (outPointer: UnsafeMutablePointer<byte>) -> vscf_status_t in
                        vsc_buffer_init(outBuf)
                        vsc_buffer_use(outBuf, outPointer, outCount)

                        return vscf_auth_decrypt(self.c_ctx, vsc_data(dataPointer, data.count), vsc_data(authDataPointer, authData.count), vsc_data(tagPointer, tag.count), outBuf)
                    })
                })
            })
        })
        out.count = vsc_buffer_len(outBuf)

        try FoundationError.handleStatus(fromC: proxyResult)

        return out
    }

    /// Calculate required buffer length to hold the authenticated decrypted data.
    @objc public func authDecryptedLen(dataLen: Int) -> Int {
        let proxyResult = vscf_auth_decrypt_auth_decrypted_len(self.c_ctx, dataLen)

        return proxyResult
    }
}
