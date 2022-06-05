<!--CHANGE PASSWORD MODAL-->
<div class="modal fade" id="ChangePasswordModal" tabindex="-1" aria-labelledby="ChangeModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="md-flex justify-content-center" id="ChangeModalLabel">CHANGE PASSWORD</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3 mt-3">
                    <label for="email" class="form-label">Email:</label>
                    <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
                </div>
                <div class="mb-3">
                    <label for="currentPwd" class="form-label">Current password:</label>
                    <input type="password" class="form-control" id="currentPwd" placeholder="Enter password" name="password">
                </div>
                <hr>
                <div class="mb-3">
                    <label for="newPwd" class="form-label">New password:</label>
                    <input type="password" class="form-control" id="newPwd" placeholder="Enter password" name="newPassword">
                </div>
                <div class="mb-3">
                    <label for="retypePwd" class="form-label">New password:</label>
                    <input type="password" class="form-control" id="retypePwd" placeholder="Enter password" name="retypePassword">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">Change password</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>