# This file is part of Relax-and-Recover, licensed under the GNU General
# Public License. Refer to the included COPYING for full text of license.
#
# 80_prune_old_backups.sh

if [ ! -z $OPT_PRUNE ]; then
    # Purge old archives according user settings.
    Log "Purging old Borg archives in repository $BORGBACKUP_REPO"
    borg prune --verbose --list ${OPT_PRUNE[@]} $OPT_REMOTE_PATH \
    --prefix ${BORGBACKUP_ARCHIVE_PREFIX}_ \
    $BORGBACKUP_USERNAME@$BORGBACKUP_HOST:$BORGBACKUP_REPO
    StopIfError "Failed to purge old backups"
else
    # Purge is not set.
    Log "Purging of old Borg archives not set, skipping"
fi
