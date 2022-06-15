<!--CHANGE PASSWORD MODAL-->
<div class="modal fade" id="ChangePasswordModal" tabindex="-1" aria-labelledby="ChangeModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="md-flex justify-content-center" id="ChangeModalLabel">CHANGE PASSWORD</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/account/changePassword" method="post">
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="currentPwd" class="form-label">Current password:</label>
                        <input type="password" class="form-control" id="currentPwd" placeholder="Enter password" name="oldPassword">
                    </div>
                    <hr>
                    <div class="mb-3">
                        <label for="newPwd" class="form-label">New password:</label>
                        <input type="password" class="form-control" id="newPwd" placeholder="Enter password" name="newPassword">
                    </div>
                    <div class="mb-3">
                        <label for="retypePwd" class="form-label">Retype password:</label>
                        <input type="password" class="form-control" id="retypePwd" placeholder="Enter password" name="retypePassword">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Change password</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                </div>
                <div class="my-3 text-danger">
                    <label>${error}</label>
                    <label>${message}</label>
                </div>
            </form>
        </div>
    </div>
</div>