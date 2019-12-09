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

@objc(VSCFKeyInfo) public class KeyInfo: NSObject {

    /// Handle underlying C context.
    @objc public let c_ctx: OpaquePointer

    /// Create underlying C context.
    public override init() {
        self.c_ctx = vscf_key_info_new()
        super.init()
    }

    /// Acquire C context.
    /// Note. This method is used in generated code only, and SHOULD NOT be used in another way.
    public init(take c_ctx: OpaquePointer) {
        self.c_ctx = c_ctx
        super.init()
    }

    /// Acquire retained C context.
    /// Note. This method is used in generated code only, and SHOULD NOT be used in another way.
    public init(use c_ctx: OpaquePointer) {
        self.c_ctx = vscf_key_info_shallow_copy(c_ctx)
        super.init()
    }

    /// Build key information based on the generic algorithm information.
    public init(algInfo: AlgInfo) {
        let proxyResult = vscf_key_info_new_with_alg_info(algInfo.c_ctx)

        self.c_ctx = proxyResult!
    }

    /// Release underlying C context.
    deinit {
        vscf_key_info_delete(self.c_ctx)
    }

    /// Return true if a key is a compound key
    @objc public func isCompound() -> Bool {
        let proxyResult = vscf_key_info_is_compound(self.c_ctx)

        return proxyResult
    }

    /// Return true if a key is a chained key
    @objc public func isChained() -> Bool {
        let proxyResult = vscf_key_info_is_chained(self.c_ctx)

        return proxyResult
    }

    /// Return true if a key is a compound key and compounds cipher key
    /// and signer key are chained keys.
    @objc public func isCompoundChained() -> Bool {
        let proxyResult = vscf_key_info_is_compound_chained(self.c_ctx)

        return proxyResult
    }

    /// Return true if a key is a compound key and compounds cipher key
    /// is a chained key.
    @objc public func isCompoundChainedCipher() -> Bool {
        let proxyResult = vscf_key_info_is_compound_chained_cipher(self.c_ctx)

        return proxyResult
    }

    /// Return true if a key is a compound key and compounds signer key
    /// is a chained key.
    @objc public func isCompoundChainedSigner() -> Bool {
        let proxyResult = vscf_key_info_is_compound_chained_signer(self.c_ctx)

        return proxyResult
    }

    /// Return true if a key is a compound key that contains chained keys
    /// for encryption/decryption and signing/verifying that itself
    /// contains a combination of classic keys and post-quantum keys.
    @objc public func isHybridPostQuantum() -> Bool {
        let proxyResult = vscf_key_info_is_hybrid_post_quantum(self.c_ctx)

        return proxyResult
    }

    /// Return true if a key is a compound key that contains a chained key
    /// for encryption/decryption that contains a classic key and
    /// a post-quantum key.
    @objc public func isHybridPostQuantumCipher() -> Bool {
        let proxyResult = vscf_key_info_is_hybrid_post_quantum_cipher(self.c_ctx)

        return proxyResult
    }

    /// Return true if a key is a compound key that contains a chained key
    /// for signing/verifying that contains a classic key and
    /// a post-quantum key.
    @objc public func isHybridPostQuantumSigner() -> Bool {
        let proxyResult = vscf_key_info_is_hybrid_post_quantum_signer(self.c_ctx)

        return proxyResult
    }

    /// Return common type of the key.
    @objc public func algId() -> AlgId {
        let proxyResult = vscf_key_info_alg_id(self.c_ctx)

        return AlgId.init(fromC: proxyResult)
    }

    /// Return compound's cipher key id, if key is compound.
    /// Return None, otherwise.
    @objc public func compoundCipherAlgId() -> AlgId {
        let proxyResult = vscf_key_info_compound_cipher_alg_id(self.c_ctx)

        return AlgId.init(fromC: proxyResult)
    }

    /// Return compound's signer key id, if key is compound.
    /// Return None, otherwise.
    @objc public func compoundSignerAlgId() -> AlgId {
        let proxyResult = vscf_key_info_compound_signer_alg_id(self.c_ctx)

        return AlgId.init(fromC: proxyResult)
    }

    /// Return chained l1 key id, if key is chained.
    /// Return None, otherwise.
    @objc public func chainedL1AlgId() -> AlgId {
        let proxyResult = vscf_key_info_chained_l1_alg_id(self.c_ctx)

        return AlgId.init(fromC: proxyResult)
    }

    /// Return chained l2 key id, if key is chained.
    /// Return None, otherwise.
    @objc public func chainedL2AlgId() -> AlgId {
        let proxyResult = vscf_key_info_chained_l2_alg_id(self.c_ctx)

        return AlgId.init(fromC: proxyResult)
    }

    /// Return l1 key id of compound's cipher key, if key is compound(chained, ...)
    /// Return None, otherwise.
    @objc public func compoundCipherL1AlgId() -> AlgId {
        let proxyResult = vscf_key_info_compound_cipher_l1_alg_id(self.c_ctx)

        return AlgId.init(fromC: proxyResult)
    }

    /// Return l2 key id of compound's cipher key, if key is compound(chained, ...)
    /// Return None, otherwise.
    @objc public func compoundCipherL2AlgId() -> AlgId {
        let proxyResult = vscf_key_info_compound_cipher_l2_alg_id(self.c_ctx)

        return AlgId.init(fromC: proxyResult)
    }

    /// Return l1 key id of compound's signer key, if key is compound(..., chained)
    /// Return None, otherwise.
    @objc public func compoundSignerL1AlgId() -> AlgId {
        let proxyResult = vscf_key_info_compound_signer_l1_alg_id(self.c_ctx)

        return AlgId.init(fromC: proxyResult)
    }

    /// Return l2 key id of compound's signer key, if key is compound(..., chained)
    /// Return None, otherwise.
    @objc public func compoundSignerL2AlgId() -> AlgId {
        let proxyResult = vscf_key_info_compound_signer_l2_alg_id(self.c_ctx)

        return AlgId.init(fromC: proxyResult)
    }
}
