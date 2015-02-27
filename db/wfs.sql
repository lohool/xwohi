DELETE FROM `t_workflowtype`;
INSERT INTO `t_workflowtype` (`id`, `createTime`, `description`, `name`, `creator_id`) VALUES
	(1, '2015-02-06 10:22:12', NULL, 'Created', 1),
	(2, NULL, NULL, 'Rejected', NULL),
	(3, NULL, NULL, 'Reopened', NULL),
	(4, NULL, NULL, 'Invalid', NULL),
	(5, NULL, NULL, 'Duplicated', NULL),
	(6, NULL, NULL, 'Canceled', NULL),
	(7, NULL, NULL, 'escalated', NULL),
	(8, NULL, NULL, 'Opened', NULL),
	(9, NULL, NULL, 'In Progress', NULL),
	(10, NULL, NULL, 'Closed', NULL),
	(11, NULL, NULL, 'Failed', NULL),
	(12, NULL, NULL, 'Pending', NULL),
	(13, NULL, NULL, 'Assigned', NULL),
	(14, NULL, NULL, 'Completed', NULL);
