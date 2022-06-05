<!--FORGOT PASSWORD MODAL-->
<div class="modal fade" id="ForgotPasswordModal" tabindex="-1" aria-labelledby="ForgotPasswordModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="md-flex justify-content-center">FORGOT PASSWORD</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3 mt-3">
                    <label for="forgot_email" class="form-label">Email:</label>
                    <input type="email" class="form-control" id="email" placeholder="Enter email" name="forgot_email">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">Send</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" data-bs-toggle="modal"
                    data-bs-target="#ForgotPasswordModal">Cancel</button>
            </div>
        </div>
    </div>
</div>