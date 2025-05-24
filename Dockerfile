FROM odoo:18.0

USER root

RUN mkdir -p /mnt/addons /mnt/accounting /mnt/theme && chown -R odoo:odoo /mnt/addons /mnt/accounting
COPY ./configurations/dev/config/odoo.conf /etc/odoo
COPY ./addons /mnt/addons
COPY ./accounting /mnt/accounting
COPY ./theme /mnt/theme

RUN chown -R odoo:odoo /mnt/extra-addons /mnt/accounting /mnt/theme

# Switch to the odoo user
USER odoo

# Expose Odoo service port
EXPOSE 8069

# Define entrypoint
ENTRYPOINT ["odoo", "-c", "/etc/odoo/odoo.conf"]
